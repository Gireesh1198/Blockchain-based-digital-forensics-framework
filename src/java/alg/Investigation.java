/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package alg;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;


public class Investigation {
    public static void main(String[] args) {
        Investigation o = new Investigation();
        String modifiedFile = o.modifiedFile();
        System.out.println(modifiedFile);
        System.out.println("-----");
        System.out.println();
    }    
    public String recentFiles(){
        String currentUsersHomeDir = System.getProperty("user.home");
        String path = currentUsersHomeDir+"\\AppData\\Roaming\\Microsoft\\Windows\\Recent";
        String recentFile = "";
        File ff = new File(path);
        File files[] = ff.listFiles();
        int temp=1;
        for(File tempFile: files){
            recentFile += temp+") "+tempFile.getPath() +" \n";
            temp++;
        }
        return  recentFile;
    }
    public String modifiedFile(){
        String currentUsersHomeDir = System.getProperty("user.home");
        File ff = new File(currentUsersHomeDir);
        List<File> list = new ArrayList();
        list.add(new File(currentUsersHomeDir+ File.separator +"\\Documents"+ File.separator ));
        list.add(new File(currentUsersHomeDir+ File.separator +"\\Downloads"+ File.separator ));
        list.add(new File(currentUsersHomeDir+ File.separator +"\\Desktop"+ File.separator ));
        String modifiedFilePath = "";
        int temp=1;
        for(File fl : list){
            File dir = new File(fl.getPath());
            File[] files = dir.listFiles();
            if (files == null || files.length == 0) {
                System.out.println("There is no file in the folder");
            }

            File lastModifiedFile = files[0];
            for (int i = 1; i < files.length; i++) {
                if (lastModifiedFile.lastModified() < files[i].lastModified()) {
                    lastModifiedFile = files[i];
                }
            }
            String k = lastModifiedFile.toString();

            Path p = Paths.get(k);
            String file = p.getFileName().toString();
            modifiedFilePath+= temp+") "+lastModifiedFile+" \n";
            temp++;
        }       
        return modifiedFilePath;
    }
}
