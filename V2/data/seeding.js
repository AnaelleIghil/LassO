import { faker } from '@faker-js/faker';

const randomMember ={
name : faker.person.lastName(),
firstname : faker.person.firstName(),
nickname : faker.word.interjection(5),
email : faker.internet.email(),
password : faker.internet.password(),
birthdate : faker.date.birthdate({ min: 1930, max: 2015}),
phone : faker.phone.number('06 ## ## ## ##'),

}
console.log(randomMember)



const randomInstrument = {
    /**
     * should created on random but not too random 
     */
}
