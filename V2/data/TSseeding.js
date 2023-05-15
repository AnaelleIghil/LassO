"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var faker_1 = require("@faker-js/faker");
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
var Size;
(function (Size) {
    Size[Size["XS"] = 0] = "XS";
    Size[Size["S"] = 1] = "S";
    Size[Size["M"] = 2] = "M";
    Size[Size["L"] = 3] = "L";
    Size[Size["XL"] = 4] = "XL";
    Size[Size["XXL"] = 5] = "XXL";
    Size[Size["XXXL"] = 6] = "XXXL";
})(Size || (Size = {}));
var randomMember = {
    name: faker_1.faker.person.lastName(),
    firstname: faker_1.faker.person.firstName(),
    nickname: faker_1.faker.word.interjection(5),
    email: faker_1.faker.internet.email(),
    password: faker_1.faker.internet.password(),
    birthdate: faker_1.faker.date.birthdate({ min: 1930, max: 2015 }),
    phone: faker_1.faker.phone.number('06 ## ## ## ##'),
    adress: faker_1.faker.location.streetAddress(),
    zip_code: faker_1.faker.location.zipCode({ france: france }),
    gender_suit: faker_1.faker.enum,
    size_up: ,
    size_bottom: ,
    status: ,
    instrument: ,
};
console.log(randomMember);
var randomSuit = {
    group: ,
    observation: ,
    size: ,
};
console.log(randomSuit);
var randomInstrument = {};
var randomTreasury = {
    paid_at: ,
    subject: ,
    pole: ,
};
var randomTreasuryMember = {};
var randomIssue = {
    content: 
};
