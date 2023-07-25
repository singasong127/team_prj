package com.team.app.infra.code;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CodeServiceImpl implements CodeService{
    @Autowired
    CodeDao dao;


    @Override
    public List<Code> selectList() {
        return dao.selectList();
    }
}
