package com.example.demo.manage.DAO;



import com.example.demo.manage.Model.Value;

import java.util.List;

public interface ValueDAO {
    public List<Value> getAllValues(String keyword);

    public void saveValue(Value theValue);

    public Value getValue(int theId);

    public void deleteValue(int theId);
}
