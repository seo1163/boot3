package com.iu.boot3.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.iu.boot3.util.FileManager;
import com.iu.boot3.util.Pager;




@Service
public class ProductService {
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private FileManager fileManager;
	
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
			}
		}
		return result;
	}
	
	public List<ProductVO> getList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makeNum(productMapper.getTotalCount(pager));
		return productMapper.getList(pager);
	}
	
}