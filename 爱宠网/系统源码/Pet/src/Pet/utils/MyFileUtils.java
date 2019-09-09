package Pet.utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/**
 * Created by GUOFENG on 2017/4/22.
 */
public class MyFileUtils {
    /**
     * 读取访问量
     *
     * @return
     * @throws IOException
     */
    public static int readTxtFile() throws IOException {
        FileReader fileReader = null;
        BufferedReader br = null;
        String sumStr = null;
        try {
            fileReader = new FileReader(Constant.countFilePath);
            br = new BufferedReader(fileReader);
            sumStr = br.readLine();
        } finally {
            if (br != null)
                br.close();
            if (fileReader != null)
                fileReader.close();

        }
        if (sumStr == null)
            return 0;
        return Integer.parseInt(sumStr);
    }

    /**
     * 写入访问量+1
     *
     * @throws IOException
     */
    public static void writeTxtFile() throws IOException {
        int sum = readTxtFile();
        FileWriter fileWriter = null;
        BufferedWriter bw = null;
        try {
            fileWriter = new FileWriter(Constant.countFilePath, false);
            bw = new BufferedWriter(fileWriter);
            bw.write(String.valueOf(sum + 1));
        } finally {
            if (bw != null)
                bw.close();
            if (fileWriter != null)
                fileWriter.close();

        }
    }

    /**
     * 创建文件
     *
     * @param filename
     */
    public static void createFile(String filename) {
        createDirectory(Constant.systemPath);
        File file = new File(filename);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 创建文件夹
     *
     * @param path
     */
    public static void createDirectory(String path) {
        File file = new File(path);
        if (!file.exists()) {
            file.mkdir();
        }
    }

    /**
     * 删除文件
     *
     * @param path
     * @return
     */
    public static void deleteFile(String path) {
        File file = new File(path);
        if (file.isFile() && file.exists()) {
            file.delete();
        }
    }


}
