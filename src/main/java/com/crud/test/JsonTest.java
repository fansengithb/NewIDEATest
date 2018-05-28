package com.crud.test;

import com.alibaba.fastjson.TypeReference;
import com.crud.entity.Person;
import com.crud.utils.JsonUtil;

import java.util.List;
import java.util.Map;

public class JsonTest {
    public static void main(String[] args) {
        test1();

    }

    static  void test0(){
        String json1 = "[{\"transaction_id\":\"1000000387679653\",\"original_purchase_date\":\"2018-04-03 10:01:02 Etc/GMT\",\"quantity\":\"1\",\"original_transaction_id\":\"1000000387679653\",\"purchase_date_pst\":\"2018-04-03 03:01:02 America/Los_Angeles\",\"original_purchase_date_ms\":\"1522749662000\",\"purchase_date_ms\":\"1522749662000\",\"product_id\":\"com.jiuying.MDTFcurtain.4998\",\"original_purchase_date_pst\":\"2018-04-03 03:01:02 America/Los_Angeles\",\"is_trial_period\":\"false\",\"purchase_date\":\"2018-04-03 10:01:02 Etc/GMT\"},{\"transaction_id\":\"1000000387962796\",\"original_purchase_date\":\"2018-04-04 06:37:47 Etc/GMT\",\"quantity\":\"1\",\"original_transaction_id\":\"1000000387962796\",\"purchase_date_pst\":\"2018-04-03 23:37:47 America/Los_Angeles\",\"original_purchase_date_ms\":\"1522823867000\",\"purchase_date_ms\":\"1522823867000\",\"product_id\":\"com.jiuying.MDTFcurtain.49980\",\"original_purchase_date_pst\":\"2018-04-03 23:37:47 America/Los_Angeles\",\"is_trial_period\":\"false\",\"purchase_date\":\"2018-04-04 06:37:47 Etc/GMT\"}]";
//       将json字符串转化为对象
        List<Map<String, String>> maplist = com.alibaba.fastjson.JSON.parseObject(json1,new TypeReference<List<Map<String, String>>>(){} );

        System.out.println(maplist);
        for (int i = 0; i < maplist.size(); i++) {
            //System.out.println(maplist.get(i).get("transaction_id"));
            System.out.println(maplist.get(i).get("transaction_id"));

        }
    }


    static  void test1(){
        Person person = new Person();
        person.setAge(23);
        person.setName("www");
        person.setSex("male");
        String aimJson = JsonUtil.toJSONString(person);
        System.out.println("pojo对象转换出来--json--:"+aimJson);

        Map<String,Object> map = JsonUtil.StringtoMap(aimJson);
        System.out.println("json转换为map:  name:"+map.get("name")+"   age:"+map.get("age"));
    }
}
