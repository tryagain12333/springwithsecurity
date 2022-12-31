package com.example.demo.manage.DAO;



import com.example.demo.manage.Model.Value;
import com.example.demo.manage.Model.ValueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class ValueDAOImpl implements ValueDAO{
    @Autowired
    private ValueRepository repo;
    @PersistenceContext
    private EntityManager currentSession;
    @Override
    public List<Value> getAllValues(String keyword) {
//        List<Value> values = currentSession.createQuery("from Value order by id").getResultList();
//           return values;
        if (keyword != null) {
            return repo.search(keyword);
        }
        else {
            List<Value> values = currentSession.createQuery("from Value order by value4").getResultList();
            return values;
        }
    }

    @Override
    public void saveValue(Value theValue) {
        currentSession.merge(theValue);

    }

    @Override
    public Value getValue(int theId) {
        Value theValue = currentSession.find(Value.class, theId);
        return theValue;
    }

    @Override
    public void deleteValue(int theId) {
        Value theValue = currentSession.find(Value.class, theId);
        currentSession.remove(theValue);
    }
}
