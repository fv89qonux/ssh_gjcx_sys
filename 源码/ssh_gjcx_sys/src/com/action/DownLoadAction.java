
package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import com.model.TbLoad;
import com.opensymphony.xwork2.ActionSupport;
import com.service.LoadService;

/**
 *
 * @author
 *
 */
public class DownLoadAction extends ActionSupport {
	
	private String url;			//url
	private String fileName;	//
	private LoadService loadService;
	
	private String docId;	

	
    public InputStream getDownloadFile() {
    	
    	//System.out.println(url);
    	//String fileUrl = this.getChinese(url);
    	//System.out.println(fileUrl);
    	String fileUrl = url;
    	System.out.println("====="+url+"========");
    	int i = fileUrl.lastIndexOf("\\", 0);
    	String name = fileUrl.substring(i+1);
    	File file = new File(Thread.currentThread().getContextClassLoader().getResource("").getPath().substring(0,Thread.currentThread().getContextClassLoader().getResource("").getPath().length()-16)+fileUrl);
    	
    	
       // File file = new File("c:\\userlist.xls");
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(file);
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return fis;
    }
    
    /**
	 * 
	 * 
	 * @param
	 * @return String
	 */
    public String execute() throws Exception {
        // TODO Auto-generated method stub
    	return super.execute();
    }

    public String fileDownload() {
    	
    	return "success";
    }	
	
	/**
	 * 
	 * 
	 * @param
	 * @return String
	 */
	public String getChinese(String name) {   
        String chineseName = name;   
        
        	try {
				chineseName = new String(chineseName.getBytes("ISO8859-1"), "UTF-8"); 
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}   
       
        return chineseName;   
    }	

	/**
	 * 
	 * 
	 * @param
	 * @return String
	 */
	public String getChineseFileName() {
    	//String chineseFileName = this.getChinese(fileName);
		String chineseFileName = this.fileName;
    	try {
			chineseFileName=java.net.URLEncoder.encode(chineseFileName, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

    	System.out.println(chineseFileName);
    	return chineseFileName;
		
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getDocId() {
		
		return docId;
	}

	public void setDocId(String docId) {
		System.out.println("++++"+docId);
		//MessageDoc messageDoc = xxglService.searchMessageDocByMessageDocId(docId);
		TbLoad doc = loadService.searchLoadByLoadId(docId);
		String url1 = doc.getUrl();
		String fileName1 = doc.getName();
		String suffix = url1.split("\\.")[1];
		System.out.println(url1);
		this.url = url1;
		this.fileName = fileName1+"."+suffix;
		this.docId = docId;
	}

	public LoadService getLoadService() {
		return loadService;
	}

	public void setLoadService(LoadService loadService) {
		this.loadService = loadService;
	}



	
}
