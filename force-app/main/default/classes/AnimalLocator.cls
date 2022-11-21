public class AnimalLocator {

public static String getAnimalNameById(Integer a)
{
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + a);
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    String AnimalName;
    if(response.getStatusCode() == 200)
    {	
        // Deserializes the JSON string into collections of primitive data types.
        Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        Map<String, Object> animals =(Map<String, Object>) results.get('animal');
        AnimalName = String.valueOf(animals.get('name'));
    }
    return AnimalName;
}
    
}