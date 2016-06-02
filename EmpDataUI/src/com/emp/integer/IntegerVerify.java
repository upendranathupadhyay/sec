package com.emp.integer;

public class IntegerVerify {
	public int getInt(String string)
	{
		if (isInt(string)) 
		{
			return Integer.parseInt(string);
		}
		else
		{
			return 0;
		}
	}
	public boolean isInt(String string)
	{
		try 
		{
			Integer.parseInt(string);
		} 
		catch (NumberFormatException nFE)
		{
			return false;
		}
		return true;
	}
}
