import { mongoose, Schema, model} from 'mongoose';
import { faker } from '@faker-js/faker';

try {
    await mongoose.connect('mongodb://127.0.0.1:27017/homedepotdb');
    console.log("connected")
} catch(e) {
    console.log(e)
}

const product2Schema = new mongoose.Schema({
    product_name: String,
    manufacturer: String,
    price: mongoose.Decimal128,
    has_warranty: Boolean,
    facts: Object,
    price_original: mongoose.Decimal128,
    price_reduced: mongoose.Decimal128,
    online_inventory: Number,
    days_to_ship: Number
});

const Prod2 = mongoose.model('Prod2', product2Schema);

for(let i = 0; i < 185746; i++) {
    let testProd = new Prod2({
        //product table
        product_name: faker.commerce.productName(),
        manufacturer: faker.vehicle.manufacturer(),
        price: faker.commerce.price({ min: 20, max: 1200, dec: 2}),
        has_warranty: faker.datatype.boolean(.5),
        //descriptions table
        facts: {
            1: faker.lorem.sentences({min: 1, max: 2}),
            2: faker.lorem.sentences({min: 1, max: 2}),
            3: faker.lorem.sentences({min: 1, max: 2}),
        },
        //promotions table
        price_original: faker.commerce.price({ min: 20, max: 1200, dec: 2}),
        price_reduced: faker.commerce.price({ min: 20, max: 1200, dec: 2}),
        //store_online table
        online_inventory: Math.floor(Math.random() * (631 - 15)) + 15, 
        days_to_ship: Math.floor(Math.random() * (7 - 2)) + 2
    });

    await testProd.save()
    console.log('Inserted Prod: ', i)
}