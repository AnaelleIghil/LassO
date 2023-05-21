import { fakerFR } from '@faker-js/faker';
import { faker } from '@faker-js/faker/locale/fr';

/**
 * Gros boulot à faire : 
  
 * Créer la méthode générative avec le slice pour les values "embétante" telle que birthdate
 * Functions en sql pour 'auto-générer" certaines tables 
 * 
 */
enum Size { XS='XS', S='S', M='M', L='L',XL='XL', XXL='XXL', XXXl='XXXL'};
enum Gender { Male='M', female='F' };
enum Status {Admin='Admin', Treasury='Treasury', Event='Event', Logistics='Logistics', Secretary='Secretary', Instruments='Instruments', Suits='Suits', Communications='Communications'};
enum Instrument {Surdo='Surdo', Repinique='Repinique', Caixa='Caixa', Tamborim='Tamborim', Chocalho='Chocalho', Agogô='Agogô', Cuica='Cuica', Apito='Apito'};
enum Group { Carnival='Carnival' , Mascarade='Mascarade', TragOul='TragOul', Rathma='Rathma', Bones='Bones', Heritage='Heritage', Jesseth='Jesseth', Pestilence='Pestilence', Inarius='Inarius'}

const randomMember ={
name : faker.person.lastName(),
firstname : faker.person.firstName(),
nickname : faker.word.interjection(5),
email : faker.internet.email(),
password : faker.internet.password(),
birthdate : faker.date.birthdate({ min: 1930, max: 2015, mode:'year'}),
phone : faker.phone.number('06 ## ## ## ##'),
adress: faker.location.streetAddress() ,
zip_code : fakerFR.location.zipCode() ,
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
    created_at : faker.date.between({from: '20/04/2017', to: '15/05/2023' }),
    paid_at : faker.date.between({from : '15/05/2023', to : '31/08/2033'}), 
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
    content : faker.lorem.lines({min: 1, max : 5}),
}
console.log("randomIssue : ", randomIssue)