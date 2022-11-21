@isTest
public class AnimalLocatorTest {

    @isTest
    static void testanimallocator()
    {
        Test.setMock(HttpCalloutmock.class, new AnimalLocatorMock());
        string result = AnimalLocator.getAnimalNameById(1);
        string expectedresult = 'chicken';
        System.assertEquals(expectedresult, result, 'Results are not same');
    }
    
}