package com.iu.boot3.product;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.iu.boot3.util.FileManager;
import com.iu.boot3.util.Pager;




@Service
@Transactional(rollbackFor = Exception.class)
public class ProductService {
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private FileManager fileManager;
	
	public int setFileDelete(ProductFilesVO productFilesVO)throws Exception{
		//DB에서 조회
		productFilesVO = productMapper.getFileDetail(productFilesVO);
		
		//HDD삭제
		//boolean result = fileManager.fileDelete(productFilesVO.getFileName(),"/resources/upload/product/");
		
		
		//DB삭제
//		if(result) {
//			productMapper.setFileDelete(productFilesVO);
//		}
//		
		int check= productMapper.setFileDelete(productFilesVO);
		if(check>0) {
		boolean result = fileManager.fileDelete(productFilesVO.getFileName(),"/resources/upload/product/");
		}
		
		return check;
	}
	

	public int setAdd(ProductVO productVO, MultipartFile [] files)throws Exception{
		int result = productMapper.setAdd(productVO);
		
		if(files != null) {
			for(MultipartFile f : files) {
				if(f.isEmpty()) {
					continue;
				}
				
				String fileName= fileManager.fileSave(f, "resources/upload/product/");
				ProductFilesVO productFilesVO = new ProductFilesVO();
				productFilesVO.setProductNum(productVO.getProductNum());
				productFilesVO.setFileName(fileName);
				productFilesVO.setOriName(f.getOriginalFilename());
				result = productMapper.setFileAdd(productFilesVO);
			
				if(result <1) {
					throw new SQLException();
				}
			}
		}
		return result;
	}
	
	public List<ProductVO> getList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makeNum(productMapper.getTotalCount(pager));
		return productMapper.getList(pager);
	}
	
	public ProductVO getDetail(ProductVO productVO) throws Exception{
		return productMapper.getDetail(productVO);
	}
	
	public ProductFilesVO getFileDetail(ProductFilesVO productFilesVO) throws Exception{
		return productMapper.getFileDetail(productFilesVO);
	}
	
	public ProductVO getManageDetail(ProductVO productVO) throws Exception{
		return productMapper.getManageDetail(productVO);
	}
	
	public int setUpdate(ProductVO productVO, MultipartFile [] multipartFiles)throws Exception{
		int result = productMapper.setUpdate(productVO);
		
		if(multipartFiles !=null) {
			for(MultipartFile multipartFile: multipartFiles) {
				if(multipartFile.isEmpty()) {
					continue;
				}
			ProductFilesVO productFilesVO = new ProductFilesVO();	
				
			String fileName	=fileManager.fileSave(multipartFile, "/resources/upload/product/");
			productFilesVO.setFileName(fileName);
			productFilesVO.setOriName(multipartFile.getOriginalFilename());
			productFilesVO.setProductNum(productVO.getProductNum());
			result = productMapper.setFileAdd(productFilesVO);
			}
		}
		
		return result;
	}
	
	public int setDelete(ProductVO productVO) throws Exception{
		List<ProductFilesVO> ar = productMapper.getFileList(productVO);
		int result = productMapper.setDelete(productVO);
		
		System.out.println("file size : "+ ar.size());
		for(ProductFilesVO f : ar) {
			fileManager.fileDelete(f.getFileName(), "resources/upload/product");
			
		}
		return result;		
	}
	
	
	
	
}