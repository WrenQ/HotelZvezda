// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package iw.zvezdahotels;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import iw.zvezdahotels.Hotel;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Hotel_Roo_Json {
    
    public String Hotel.toJson() {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(this);
    }
    
    public String Hotel.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(this);
    }
    
    public static Hotel Hotel.fromJsonToHotel(String json) {
        return new JSONDeserializer<Hotel>()
        .use(null, Hotel.class).deserialize(json);
    }
    
    public static String Hotel.toJsonArray(Collection<Hotel> collection) {
        return new JSONSerializer()
        .exclude("*.class").deepSerialize(collection);
    }
    
    public static String Hotel.toJsonArray(Collection<Hotel> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<Hotel> Hotel.fromJsonArrayToHotels(String json) {
        return new JSONDeserializer<List<Hotel>>()
        .use("values", Hotel.class).deserialize(json);
    }
    
}
