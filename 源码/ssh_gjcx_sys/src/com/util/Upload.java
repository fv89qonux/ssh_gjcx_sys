package com.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

/**
 * 文件上传
 * 
 * @author Administrator
 */
public class Upload {
	
	private java.util.List<File> uploads;
    private java.util.List<String> uploadsFileName;
    private java.util.List<String> uploadsContentType;
    private java.util.List<String> urls = new ArrayList();

    public java.util.List<String> getUploadFileName()
    {
        return uploadsFileName;
    }
    public void setUploadFileName(java.util.List<String> fileNames)
    {
        this.uploadsFileName = fileNames;
    }
    public java.util.List<File> getUpload()
    {
        return uploads;
    }

    public void setUpload(java.util.List<File> uploads)
    {
        this.uploads = uploads;
    }

    public void setUploadContentType(java.util.List<String> contentTypes)
    {
        this.uploadsContentType = contentTypes;

    }

    public java.util.List<String> getUploadContentType()
    {
        return this.uploadsContentType;
    }

    public java.util.List<String> getUrls() {
		return urls;
	}
    
	public void setUrls(java.util.List<String> urls) {
		this.urls = urls;
	}
	
	
	public void uploadFile()
    {
		String beforeUrl = Thread.currentThread().getContextClassLoader().getResource("").getPath().substring(0,Thread.currentThread().getContextClassLoader().getResource("").getPath().length()-16)+"/upload/";
		
		createFolder(beforeUrl);
        if (uploads != null)
        {
            int i = 0;
            for (; i < uploads.size(); i++)
            {
                java.io.InputStream is;
                java.io.OutputStream os;
				try {
					is = new java.io.FileInputStream(uploads.get(i));
					String url = beforeUrl + this.getLastFileName(uploadsFileName.get(i),(i+1)+"");
					os = new java.io.FileOutputStream(url);
					byte buffer[] = new byte[8192];
		            int count = 0;
		            while ((count = is.read(buffer)) > 0)
		            {
		                os.write(buffer, 0, count);
		            }
		            //String url = beforeUrl + this.getLastFileName(uploadsFileName.get(i));
		            urls.add(url);
		            os.close();
		            is.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}             
            }
        }
    }
	
	
	public String getLastFileName(String fileName,String index) {
		int i = fileName.lastIndexOf(".");
		String lastFileName = fileName.substring(0, i) +"(" + DateUtility.getCurrentTimeOnPlain() + "00" + index + ")" + fileName.substring(i);
		
		return lastFileName;
	}
	
	/**
	 * 
	 * @param path
	 */
	public void createFolder(String path){
		File file = new File(path); 
        if(file.exists()){ 
	        System.out.println( "the   dir   is   exits ");   
	    }else{ 
	        file.mkdir(); 
	        System.out.println( "have   made   a   dir   "   ); 
        } 
	}
}
