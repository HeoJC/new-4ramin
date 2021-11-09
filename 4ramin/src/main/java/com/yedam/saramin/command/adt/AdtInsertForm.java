package com.yedam.saramin.command.adt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.saramin.comm.Command;

public class AdtInsertForm implements Command {

	@Override
	public String run(HttpServletRequest request, HttpServletResponse response) {
		return "adoptions/adtInsertForm";
	}

}
