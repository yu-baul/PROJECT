package com.koreait.pro.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface ProCommand {
	
	public void execute(SqlSession sqlSession, Model model);
}
