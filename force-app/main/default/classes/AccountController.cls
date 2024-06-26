public class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpps( String searchKey, String sortBy, String sortDirection) {
        
       String query = 'SELECT Id, Name,StageName,CloseDate,Amount FROM Opportunity';
       system.debug('query---'+query);
        if ( searchKey != null && searchKey != '' ) {
            String key = '%' + searchKey + '%';
            query += ' WHERE Name LIKE :key';
        }
        if ( sortBy != null && sortDirection != null ) {
            query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
        }
        //Here I have created a new variable for testing purpose only 
        String test = 'val';
        query = query + ' LIMIT 10';
        return Database.query( query );

      
    }
}