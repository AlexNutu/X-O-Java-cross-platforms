package newpackage;

/**
 * Created by Alex Nutu on 5/2/2017.
 */

//singleton
//functie de find partner, primul ce se inregistreaza si nu e nimeni in asteptare, il adaugam, cand vine si il doilea, se imperecheaza
//daca aveti probleme cu singleton (nu stiti ce e aia sau cum se face) folositi direct campuri si metode statice
//macar pana va iese si apoi imbunatatiti
// (e doar o sugestie, procedati cum doriti)

public class Matchmaker {
    private static Matchmaker ourInstance = new Matchmaker();

    public static Matchmaker getInstance() {
        return ourInstance;
    }

    
    private Matchmaker() {}
}
