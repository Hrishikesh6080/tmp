package sam;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class AdderTest {

	    @Test
	    public void testAdd() {
	        Adder adder = new Adder();
	        int result = adder.add(3, 5);
	        assertEquals(8, result);
	        System.out.println("Success");
	    }
	}