package com.example.demo.manage.Service;



import com.example.demo.manage.Model.Value;

import java.util.List;

public interface ValueService {
    public List<Value> getAllValues(String keyword);

    public void saveValue(Value theValue);

    public Value getValue(int theId);

    public void deleteValue(int theId);
}
