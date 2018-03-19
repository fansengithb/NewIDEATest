package com.crud.test;

import com.crud.entity.Person;

import java.io.*;
import java.text.MessageFormat;

/**
 * Created by Dice on 2018/3/16.
 */
public class TestObjSerializeAndDeserialize {
    public static void main(String[] args) throws  Exception{

        SerializePerson();   //序列化Person对象
        Person p = DeserializePerson();
        System.out.println("序列化成功:");
        System.out.println(MessageFormat.format("name = {0},age = {1},sex = {2}",p.getName(),p.getAge(),p.getSex()));


    }

    /**
     *  序列化 Person对象
     */
    private  static void  SerializePerson() throws FileNotFoundException, IOException {

        Person person = new Person();
        person.setAge(23);
        person.setName("www");
        person.setSex("男");

//        ObjectOutputStream 对象输出流将Person对象储存到D盘中的Person.txt文件中,完成对Person对象的序列化操作
        ObjectOutputStream objectOutputStream = new ObjectOutputStream(new FileOutputStream(new File("D:/www/Person.txt")));
        objectOutputStream.writeObject(person);
        System.out.println("Person对象序列化成功!");
        objectOutputStream.close();
    }

    private static  Person DeserializePerson() throws Exception,IOException{
        ObjectInputStream objectInputStream = new ObjectInputStream(new FileInputStream(new File("D:/www/Person.txt")));
        Person person = (Person) objectInputStream.readObject();
        System.out.println("Person对象反序列化成功!");
        return  person;
    }
}
