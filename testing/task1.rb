class Test_Class 
    class << self
	    def test()
	    	puts yield
	    end
	    
	    def assert_eq(value1, value2)
	    	if value1 == value2
	    	    return "Passed"
	    	end
	    	return "Error"
	    end
	    
	    def assert_includes(array, element)
	    	if array.include? element
	    	    return "Passed"
	    	end
	    	return "Error"
	    end
	    
	    def assert_exception
	    	message = yield
	    	if message == "Error"
	    	    return "Passed"
	    	elsif message == "Passed"
	    	    return "Error" 
	    	end
	    end
    end
end

Test_Class.test() do
    Test_Class.assert_eq(6*6,36)
end

Test_Class.test() do
    Test_Class.assert_eq(6*6,37)
end

Test_Class.test() do
    Test_Class.assert_includes([1,2,3],2)
end

Test_Class.test() do
    Test_Class.assert_includes([1,2,3],4)
end

Test_Class.test do
  Test_Class.assert_exception do
     Test_Class.assert_includes([5,6,7], 8)
  end
end

Test_Class.test do
  Test_Class.assert_exception do
     Test_Class.assert_includes([5,6,7], 6)
  end
end


