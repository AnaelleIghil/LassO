import { faker, fr } from '@faker-js/faker';

/**
 * Gros boulot à faire : 
 * Définir ce qui peut etre utilisé via la bibliotheque Faker, et ce qui doit etre créer
 * si cela doit etre créer, comment faire ? puis je utiliser une méthode faker, ou dois-je randomiser ça ? 
 * 
 * corriger les générations faker qui ne sont pas fr style 
 * 
 * Créer la méthode générative avec le slice pour les values "embétante" telle que birthdate
 * Functions en sql pour 'auto-générer" certaines tables 
 * 
 */
enum Size { XS, S, M, L, XL, XXL, XXXL }
const randomMember ={
name : faker.person.lastName(),
firstname : faker.person.firstName(),
nickname : faker.word.interjection(5),
email : faker.internet.email(),
password : faker.internet.password(),
birthdate : faker.date.birthdate({ min: 1930, max: 2015}),
phone : faker.phone.number('06 ## ## ## ##'),
adress: faker.location.streetAddress() ,
zip_code : faker.location.zipCode({ france }) ,
gender_suit : faker.enum,
size_up : ,
size_bottom : ,
status : ,
instrument : ,

}
console.log(randomMember)

const randomSuit = {
    group :,
    observation : ,
    size : ,
}

console.log(randomSuit)
const randomInstrument = {
    
}

const randomTreasury= {
paid_at : , 
subject : ,
pole : ,
}

const randomTreasuryMember = {

}

const randomIssue = {
    content : 
}