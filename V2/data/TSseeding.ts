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
enum InstrumentType {Surdo='Surdo', Repinique='Repinique', Caixa='Caixa', Tamborim='Tamborim', Chocalho='Chocalho', Agogô='Agogô', Cuica='Cuica', Apito='Apito'};
enum Group { Carnival='Carnival' , Mascarade='Mascarade', TragOul='TragOul', Rathma='Rathma', Bones='Bones', Heritage='Heritage', Jesseth='Jesseth', Pestilence='Pestilence', Inarius='Inarius'}
/*
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

const randomSuit = {
    group : faker.helpers.enumValue(Group),
    gender: faker.helpers.enumValue(Gender),
    observation: faker.company.catchPhrase(),
   // observation : faker.word.words({count : { min : 1, max: 15}}),
    size : faker.helpers.enumValue(Size),
}
console.log("randomSuit: ", randomSuit)

const randomInstrument = {
    name : faker.string.alpha(4),
    type : faker.helpers.enumValue( Instrument),
    observation : faker.company.catchPhrase(),
    rods : faker.number.int(8),
    weight : faker.number.float({min: 0.5, max: 50, precision: 0.1}),
    sticker: faker.datatype.boolean()
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
const randomMessage ={
    id_Member: faker.number.int({min: 1, max: 69}),
    id_organization : faker.helpers.enumValue(Status),
    send_at: faker.date.between({from: '20/04/2017', to: '15/05/2023'}),
    subject : faker.word.adjective(),
    content: faker.lorem.paragraph({min:1, max:5}),
} 

/*

/**
 * List of all interface used in theis code 
 * 
 */
interface Member {
    name : string;
firstname : string;
nickname : string;
email : string;
password : string;
birthdate : Date;
phone : string|number;
adress: string;
zip_code : string |number;
gender_suit : string;
size_up : string;
size_bottom : string;
status :string;
instrument :string;
}

interface Suit {
    group : string;
    gender: string;
    observation: string;
    size : string;
}
interface Instrument {
    name : string;
    type : string;
    observation : string;
    rods : number;
    weight : number;
    sticker: boolean ; 
}
interface Treasury{
    created_at : Date;
    paid_at : Date;
    subject : string;
    pole : string;
}
interface TreasuryMember{
    status_deposit: boolean
    status_cotisation: boolean
}
interface Issue {
    id_Member: number;
    id_organization : string;
    content : string;
}
interface Message {
    id_Member: number;
    id_organization : string;
    send_at: Date;
    subject :string;
    content: string;
}


const Nb_Users:number= 69 ;

 /**
  * function to execute 
  */

function generateMember(Nb_Users:number): any {
    const Members: Array<Member>= [];
    for (let i=0; i < Nb_Users ; i +=1){
        const randomMember: Member ={
            name : faker.person.lastName(),
            firstname : faker.person.firstName(),
            nickname : faker.word.interjection(5),
            email : faker.internet.email(),
            password : faker.internet.password(),
            birthdate : faker.date.birthdate({ min: 1930, max: 2015, mode:'year'}),
            phone : faker.phone.number('06########'),
            adress: faker.location.streetAddress() ,
            zip_code : fakerFR.location.zipCode() ,
            gender_suit : faker.helpers.enumValue(Gender),
            size_up : faker.helpers.enumValue(Size) ,
            size_bottom : faker.helpers.enumValue(Size),
            status : faker.helpers.enumValue(Status),
            instrument : faker.helpers.enumValue(InstrumentType),
            }
            Members.push(randomMember);
    }
    console.log(Members)
    return Members;

}

//generateMember(Nb_Users);

function generateSuit(Nb_Users:number): any{
    const Suits: Array<Suit>=[];
    for (let i=0; i< Nb_Users ; i+=1){
        const randomSuit : Suit={
            group : faker.helpers.enumValue(Group),
            gender: faker.helpers.enumValue(Gender),
            observation: faker.company.catchPhrase(),
            size : faker.helpers.enumValue(Size),
        }
        Suits.push(randomSuit);
    }
    return Suits;
}

function generateInstrument(Nb_Users:number): any{
    const Instruments: Array<Instrument>=[];
    for (let i=0; i< Nb_Users; i+=1){
        const randomInstrument : Instrument = {
            name : faker.string.alpha(4),
            type : faker.helpers.enumValue( InstrumentType),
            observation : faker.company.catchPhrase(),
            rods : faker.number.int(8),
            weight : faker.number.float({min: 0.5, max: 50, precision: 0.1}),
            sticker: faker.datatype.boolean()
        }
        Instruments.push(randomInstrument)
    }
    return Instruments;
}

function generateTreasury(Nb_Users:number): any{
    const Treasuries: Array<Treasury>=[];
    for (let i=0; i <Nb_Users; i+=1){
        const randomTreasury: Treasury= {
            created_at : faker.date.between({from: '20/04/2017', to: '15/05/2023' }),
            paid_at : faker.date.between({from : '15/05/2023', to : '31/08/2033'}), 
            subject : faker.company.catchPhraseDescriptor(),
            pole : faker.helpers.enumValue(Status),
        }
        Treasuries.push(randomTreasury)
    }
    return Treasuries;
}

function generateTreasuryMember(Nb_Users:number):any{
    const TreasuriesMember:Array<TreasuryMember>=[];
    for (let i=0; i< Nb_Users; i+=1){
        const randomTreasuryMember: TreasuryMember = {
            status_deposit: faker.datatype.boolean(),
            status_cotisation: faker.datatype.boolean(),
        }
        TreasuriesMember.push(randomTreasuryMember)
    }
    return TreasuriesMember;
}

function generateIssue(Nb_Users:number):any{
    const Issues:Array<Issue>=[];
    for (let i=0; i< Nb_Users; i+=1){
        const randomIssue: Issue = {
            id_Member: faker.number.int({min: 1, max: 69}),
            id_organization : faker.helpers.enumValue(Status),
            content : faker.lorem.lines({min: 1, max : 5}),
        }
        Issues.push(randomIssue)
    }
    return Issues;
}
function generateMessage(Nb_Users:number):any{
    const Messages:Array<Message>=[];
    for (let i=0; i< Nb_Users; i+=1){
        const randomMessage : Message ={
            id_Member: faker.number.int({min: 1, max: 69}),
            id_organization : faker.helpers.enumValue(Status),
            send_at: faker.date.between({from: '20/04/2017', to: '15/05/2023'}),
            subject : faker.word.adjective(),
            content: faker.lorem.paragraph({min:1, max:5}),
        } 
    }
}