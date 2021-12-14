class Test_Class 
    class << self
	    def test()
	    	puts yield
	    end
	    
	    def assert_eq(value1, value2)
	    	return "Passed" if value1 == value2
	    	"Error"
	    end
	    
	    def assert_includes(array, element)
	    	return "Passed" if array.include?(element)
		"Error"
	    end
	    
	    def assert_exception
	    	message = yield
	    	
	    	message == "Error" ? "Passed" : "Error"
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


