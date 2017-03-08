package com.echo.util;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.ArrayList;

/**
 * Created by Echo on 2017-03-08.
 */
public class CommonUtil {

    /**
     * 分两步，先反序列化出ArrayList<JsonObject>，然后在一个个的把JsonObject转成classOfT类型的对象。
      */
    public static <T> ArrayList<T> jsonToList(String json, Class<T> classOfT) {
        Type type = new TypeToken<ArrayList<JsonObject>>(){}.getType();
        ArrayList<JsonObject> jsonObjs = new Gson().fromJson(json, type);

        ArrayList<T> listOfT = new ArrayList<>();
        for (JsonObject jsonObj : jsonObjs) {
            listOfT.add(new Gson().fromJson(jsonObj, classOfT));
        }

        return listOfT;
    }
}
