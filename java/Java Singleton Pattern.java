import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;
import java.lang.reflect.*;


class Singleton{
    public String str;
    private static Singleton singleton_instance = null;
    private Singleton(){
        str = "";
    }
    public static Singleton getSingleInstance(){
        if (singleton_instance == null){
            singleton_instance = new Singleton();
        }
        return singleton_instance;
    }
}