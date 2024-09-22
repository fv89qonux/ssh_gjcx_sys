package com.service.impl;


import java.text.SimpleDateFormat;
import java.util.List;



import com.dao.LoadDao;
import com.model.TbLoad;
import com.model.TbLoadDto;
import com.service.LoadService;
import com.util.PageUtil;
import com.util.Upload;

public class LoadServiceImpl implements LoadService{
	
	private LoadDao loadDao;

	public List search(PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return loadDao.search(pageUtil);
	}
	

	public long countRecord(String hql) {
		return this.loadDao.countRecord(hql);
	}

	public void insert(TbLoadDto loaddto) {
		Upload upload = loaddto.getUpload();
		TbLoad load = loaddto.getTbLoad();
		SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate=date.format(new java.util.Date());
		
		load.setIntime(currentDate);

		
		//显示upload情况
		System.out.println("upload为："+upload);
		// 在upload不为空的情况下执行插入方法
		if (upload != null) {
			// 得到upload对象，得到基础信息的主键，执行文档物理储存
			upload.uploadFile();
			// 获得储存后的文件名和url地址列表
			List uploadFileNames = upload.getUploadFileName();
			List urls = upload.getUrls();
			// 循环将文件名和对应的url地址存入数据库中形成数据
			for (int i = 0; i < uploadFileNames.size(); i++) {

				String[] url = urls.get(i).toString().split("/");
				String fileurl = url[url.length - 1];
				 
				/*
				 * 创建附件对象，赋入属性信息，储存
				 */
				
				load.setUrl("upload/"+fileurl);
			}
		}
		loadDao.insert(load);
	}
	
	public void delete(TbLoadDto loaddto) {
		// TODO Auto-generated method stub
		loadDao.delete(loaddto);
	}

	public TbLoad searchLoadByLoadId(String id) {
		return loadDao.searchLoadByLoadId(id);
	}

	
	public LoadDao getLoadDao() {
		return loadDao;
	}

	public void setLoadDao(LoadDao loadDao) {
		this.loadDao = loadDao;
	}


	
	
	
	
}
