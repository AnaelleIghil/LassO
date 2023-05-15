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
enum Size { XS, S, M, L, XL, XXL, XXXL };
enum Gender { M, F };
enum Status {Admin, Treasury, Event, Logistics, Secretary, Instruments, Suits, Communications};
enum Instrument {Surdo, Repinique, Caixa, Tamborim, Chocalho, Agogô, Cuica, Apito};
enum Group { Carnival , Mascarade, TragOul, Rathma, Bones, Heritage, Jesseth, Pestilence, Inarius }

const randomMember ={
name : faker.person.lastName(),
firstname : faker.person.firstName(),
nickname : faker.word.interjection(5),
email : faker.internet.email(),
password : faker.internet.password(),
birthdate : faker.date.birthdate({ min: 1930, max: 2015}),
phone : faker.phone.number('06 ## ## ## ##'),
adress: faker.location.streetAddress() ,
zip_code : faker.location.zipCode({ state: "FR"}) ,
gender_suit : faker.helpers.enumValue(Gender),
size_up : faker.helpers.enumValue(Size) ,
size_bottom : faker.helpers.enumValue(Size),
status : faker.helpers.enumValue(Status),
instrument : faker.helpers.enumValue(Instrument),

}
console.log("randomMember: ", randomMember)

const randomSuit = {
    group : faker.helpers.enumValue(Group),
    gender: faker.helpers.enumValue(Gender),
    observation: faker.company.catchPhrase(),
   // observation : faker.word.words({count : { min : 1, max: 15}}),
    size : faker.helpers.enumValue(Size),
}
console.log("randomSuit: ", randomSuit)

const randomInstrument = {
    
}
console.log("randomInstrument : ", randomInstrument)

const randomTreasury= {
    created_at : faker.date.between({from: 20/04/2017, to: 15/05/2023 }),
    paid_at : faker.date.between({from : 15/05/2023, to : 31/08/2033}), 
    subject : faker.company.catchPhraseDescriptor(),
    pole : faker.helpers.enumValue(Status),
}
console.log(randomTreasury)

const randomTreasuryMember = {
    status_deposit: faker.datatype.boolean(),
    status_cotisation: faker.datatype.boolean(),
}
console.log("randomTreasuryMember : ", randomTreasuryMember)

const randomIssue = {
    id_Member: faker.number.int({min: 1, max: 69}),
    id_organization : faker.helpers.enumValue(Status),
    content : faker.,
}
console.log("randomIssue : ", randomIssue)