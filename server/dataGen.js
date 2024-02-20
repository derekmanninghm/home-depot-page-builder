import { faker, fr, fr_SN } from '@faker-js/faker';
import pg from "pg";
import fs from 'fs';

console.log('Running dataGen...');

const { Pool } = pg;

const homedepotdb = new Pool({
    connectionString: 'postgres://drkmannn:2448@localhost/home_depot_local_db'
})


const generateProduct = async() => {
    try {
        let assignedProductId = await homedepotdb.query('INSERT INTO PRODUCTS (product_name, manufacturer, price, has_warranty) VALUES ($1, $2, $3, $4) RETURNING id', [faker.commerce.productName(), faker.vehicle.manufacturer(), 
            faker.commerce.price({ min: 20, max: 1200, dec: 2}), 
            faker.datatype.boolean(.5)]);
        
        let currentProductID = assignedProductId.rows[0].id;

        for(let i = 0; i < Math.floor(Math.random() * 4) + 1; i++) {
            await homedepotdb.query('INSERT INTO customer_questions (product_id, question_content, user_name, question_date, response_user_name, response_content, response_date) VALUES ($1, $2, $3, $4, $5, $6, $7)',
            [currentProductID, faker.lorem.sentences({ min: 1, max: 3 }), faker.internet.userName(), faker.date.anytime(), faker.internet.userName(), faker.lorem.sentences({ min: 1, max: 3 }), faker.date.anytime()]);
        }

        for(let i = 0; i < 3; i++) {
            await homedepotdb.query('INSERT INTO descriptions (fact, product_id) VALUES ($1, $2)', [faker.lorem.sentences({min: 1, max: 2}), currentProductID])
        }

        await homedepotdb.query('INSERT INTO img_in_product_list (product_id, img_product_list_ref, img_product_list_source) VALUES ($1, $2, $3)', [currentProductID, faker.internet.url(), faker.image.url()]);
        
        for(let i = 0; i < Math.floor(Math.random() * 15) + 10; i++) {
            await homedepotdb.query('INSERT INTO img_urls (product_id, img_url) VALUES ($1, $2)', [currentProductID, faker.image.url()]);
        }

        for(let i = 0; i < Math.floor(Math.random() * (8 - 5) ) + 5; i++) {
            await homedepotdb.query('INSERT INTO product_list (product_id, item_description) VALUES ($1, $2)', [currentProductID, faker.lorem.sentences({ min: 1, max: 3 })]);
        }

        for(let i = 0; i < 4; i++) {
            await homedepotdb.query('INSERT INTO productdetails_images (imagesrc, alttext, title, detail, product_id) VALUES ($1, $2, $3, $4, $5)',
                            [faker.image.url(), faker.lorem.words({ min: 1, max: 3 }), faker.lorem.words({ min: 1, max: 2 }), faker.lorem.sentences({ min: 1, max: 3 }), currentProductID]);
        }

        await homedepotdb.query(`INSERT INTO products_description (product_id, description) VALUES ($1, $2)`, [currentProductID, faker.lorem.sentences({ min: 5, max: 7 })]);

        await homedepotdb.query('INSERT INTO promotions (product_id, price_original, price_reduced) VALUES ($1, $2, $3)', [currentProductID, faker.commerce.price({ min: 100, max: 1999, dec: 2 }), faker.commerce.price({ min: 100, max: 1999, dec: 2 })]);

        for(let i = 0; i < 10; i++) {
            let queryRes = await  homedepotdb.query('INSERT INTO reviews (product_id, content, reviewer_name, rating, title, review_date, isrecommended) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id',
                            [currentProductID, faker.lorem.sentences({ min: 1, max: 4 }), faker.internet.userName(), Math.floor(Math.random() * (5 - 1)) + 1, faker.lorem.words({ min: 2, max: 4 }),
                             faker.date.anytime(), faker.datatype.boolean(.5)])
                             
            let currentReviewID = queryRes.rows[0].id;

            for(let i = 0; i < Math.floor(Math.random() * (15 - 5)) + 5; i++) {
                await homedepotdb.query('INSERT INTO review_images (review_id, img_url, product_id) VALUES ($1, $2, $3)', [currentReviewID, faker.image.url(), currentProductID])
            }
        }

        await homedepotdb.query('INSERT INTO specifications_details (battery_amp_hours, blows_per_minute, color_family, cordless_tool_type, drill_driver_type, included, motor_type, power_tool_features, returnable, torque, battery_motor_type, other_included, condition, is_cordless, drive_size, max_speed_rpm, num_batteries_included, product_weight, tools_product_type, voltage, product_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21)',
                [Math.floor(Math.random() * (3 - 2)) + 2, Math.floor(Math.random() * (24000 - 12000)) + 12000, faker.internet.color(), faker.lorem.words({ min: 2, max: 2 }), faker.lorem.words({ min: 2, max: 2 }), 
                 faker.lorem.words({ min: 1, max: 2 }), faker.lorem.words({ min: 1, max: 1 }), faker.lorem.words({ min: 1, max: 3 }), faker.lorem.words({ min: 1, max: 1 }), Math.floor(Math.random() * (800 - 200)) + 200,
                 faker.lorem.words({ min: 1, max: 1 }), faker.lorem.words({ min: 1, max: 3 }), faker.lorem.words({ min: 1, max: 2 }), faker.lorem.words({ min: 1, max: 1 }), faker.lorem.words({ min: 2, max: 2 }), 
                 faker.lorem.words({ min: 1, max: 2 }), Math.floor(Math.random() * (3 - 1)) + 1, Math.floor(Math.random() * (5 - 3.5)) + 3.5 + ' lb', faker.lorem.words({ min: 1, max: 2 }),
                 Math.floor(Math.random() * (22 - 12)) + 12 + ' V', currentProductID]);

        await homedepotdb.query('INSERT INTO specifications_dimensions (product_id, depth, depth_unit_of_measure, width, width_unit_of_measure, height, height_unit_of_measure) VALUES ($1, $2, $3, $4, $5, $6, $7)',
                 [currentProductID, Math.floor(Math.random() * (18 - 7)) + 7, 'in', Math.floor(Math.random() * (15 - 2)) + 2, 'in', Math.floor(Math.random() * (9 - 4)) + 4, 'in']);
        
        await homedepotdb.query('INSERT INTO store_local (zipcode, city_name, product_id, inventory) VALUES ($1, $2, $3, $4)',
                 [faker.location.zipCode('#####'), faker.location.city(), currentProductID, Math.floor(Math.random() * (63))]);

        await homedepotdb.query('INSERT INTO store_online (product_id, inventory, days_to_ship) VALUES ($1, $2, $3)',
                  [currentProductID, Math.floor(Math.random() * (631 - 15)) + 15, Math.floor(Math.random() * (7 - 2)) + 2]);
    
        await homedepotdb.query('INSERT INTO warranty_certifications (product_id, certifications_listings, manufacturer_warranty) VALUES ($1, $2, $3)',
               [currentProductID, faker.lorem.words({ min: 1, max: 2 }), faker.lorem.words({ min: 3, max: 6 })]);

        return 'Success Generating Product - LP#: ';
        } catch(e) {
            console.error(e);
            return 'Failure Generating Product - LP#: ';
    }
}

// for(let i = 0; i < 2000000; i++) {
//     let created = await generateProduct();
//     console.log(created, i);
// }


const generateProductInfo = async (batchSize) => {
    const productData = [];

    for(let j = 0; j < batchSize; j++) {
        const assignedProductId = await homedepotdb.query('INSERT INTO PRODUCTS (product_name, manufacturer, price, has_warranty) VALUES ($1, $2, $3, $4) RETURNING id', [
            faker.commerce.productName(),
            faker.vehicle.manufacturer(), 
            faker.commerce.price({ min: 20, max: 1200, dec: 2}), 
            faker.datatype.boolean(.5)]);

            
        const currentProductID = assignedProductId.rows[0].id;

        for(let i = 0; i < 10; i++) {
            let queryRes = await  homedepotdb.query('INSERT INTO reviews (product_id, content, reviewer_name, rating, title, review_date, isrecommended) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id',
                                [currentProductID, faker.lorem.sentences({ min: 1, max: 4 }), faker.internet.userName(), Math.floor(Math.random() * (5 - 1)) + 1, faker.lorem.words({ min: 2, max: 4 }),
                                 faker.date.anytime(), faker.datatype.boolean(.5)])
                                 
            let currentReviewID = queryRes.rows[0].id;
    
            for(let i = 0; i < Math.floor(Math.random() * (15 - 5)) + 5; i++) {
                await homedepotdb.query('INSERT INTO review_images (review_id, img_url, product_id) VALUES ($1, $2, $3)', [currentReviewID, faker.image.url(), currentProductID])
            }
        }

        const customerQuestionsValues = [];
        const descriptionsValues = [];
        const img_in_product_listValues = [];
        const img_urlsValues = [];
        const product_listValues = [];
        const productdetails_imagesValues = [];
        const products_descriptionValues = [];
        const promotionsValues = [];
        const specifications_detailsValues = [];
        const specifications_dimensionsValues = [];
        const store_localValues = []
        const store_onlineValues = [];
        const warranty_certificationsValues = [];

        for(let i = 0; i < Math.floor(Math.random() * 4) + 1; i++) {
            customerQuestionsValues.push([currentProductID, faker.lorem.sentences({ min: 1, max: 3 }), faker.internet.userName(), faker.date.anytime(), faker.internet.userName(), faker.lorem.sentences({ min: 1, max: 3 }), faker.date.anytime()]);
        }

        for(let i = 0; i < 3; i++) {
            descriptionsValues.push([faker.lorem.sentences({min: 1, max: 2}), currentProductID]);
        }

        img_in_product_listValues.push(currentProductID, faker.internet.url(), faker.image.url())

        for(let i = 0; i < Math.floor(Math.random() * 15) + 10; i++) {
            img_urlsValues.push([currentProductID, faker.image.url()]);
        }

        for(let i = 0; i < Math.floor(Math.random() * (8 - 5) ) + 5; i++) {
            product_listValues.push([currentProductID, faker.lorem.sentences({ min: 1, max: 3 })]);
        }

        for(let i = 0; i < 4; i++) {
            productdetails_imagesValues.push([faker.image.url(), faker.lorem.words({ min: 1, max: 3 }), faker.lorem.words({ min: 1, max: 2 }), faker.lorem.sentences({ min: 1, max: 3 }), currentProductID]);
        }

        products_descriptionValues.push(currentProductID, faker.lorem.sentences({ min: 5, max: 7 }));

        promotionsValues.push(currentProductID, faker.commerce.price({ min: 100, max: 1999, dec: 2 }), faker.commerce.price({ min: 100, max: 1999, dec: 2 }));

        specifications_detailsValues.push([Math.floor(Math.random() * (3 - 2)) + 2, Math.floor(Math.random() * (24000 - 12000)) + 12000, faker.internet.color(), faker.lorem.words({ min: 2, max: 2 }), faker.lorem.words({ min: 2, max: 2 }), 
            faker.lorem.words({ min: 1, max: 2 }), faker.lorem.words({ min: 1, max: 1 }), faker.lorem.words({ min: 1, max: 3 }), faker.lorem.words({ min: 1, max: 1 }), Math.floor(Math.random() * (800 - 200)) + 200,
            faker.lorem.words({ min: 1, max: 1 }), faker.lorem.words({ min: 1, max: 3 }), faker.lorem.words({ min: 1, max: 2 }), faker.lorem.words({ min: 1, max: 1 }), faker.lorem.words({ min: 2, max: 2 }), 
            faker.lorem.words({ min: 1, max: 2 }), Math.floor(Math.random() * (3 - 1)) + 1, Math.floor(Math.random() * (5 - 3.5)) + 3.5 + ' lb', faker.lorem.words({ min: 1, max: 2 }),
            Math.floor(Math.random() * (22 - 12)) + 12 + ' V', currentProductID]);


        specifications_dimensionsValues.push(currentProductID, Math.floor(Math.random() * (18 - 7)) + 7, 'in', Math.floor(Math.random() * (15 - 2)) + 2, 'in', Math.floor(Math.random() * (9 - 4)) + 4, 'in');

        store_localValues.push(faker.location.zipCode('#####'), faker.location.city(), currentProductID, Math.floor(Math.random() * (63)));

        store_onlineValues.push(currentProductID, Math.floor(Math.random() * (631 - 15)) + 15, Math.floor(Math.random() * (7 - 2)) + 2);

        warranty_certificationsValues.push(currentProductID, faker.lorem.words({ min: 1, max: 2 }), faker.lorem.words({ min: 3, max: 6 }));

        productData.push({
            currentProductID,
            customerQuestionsValues,
            descriptionsValues,
            img_in_product_listValues,
            img_urlsValues,
            product_listValues,
            productdetails_imagesValues,
            products_descriptionValues,
            promotionsValues,
            specifications_detailsValues,
            specifications_dimensionsValues,
            store_localValues,
            store_onlineValues,
            warranty_certificationsValues,
        })

        return productData
    }
}

const generateProducts = async (totalCount) => {
    try {
        const batchSize = 1;
        const totalBatches = Math.ceil(totalCount / batchSize);

        for(let i = 0; i < totalBatches; i++) {
            const productData = await generateProductInfo(batchSize);
            console.log(await productData)
            await Promise.all(productData.map(async (product)=> {
                product.customerQuestionsValues.map((q)=> {
                        fs.writeFile('test2.js', JSON.stringify(q), ()=> console.log('wrote'))
                })
                
                //await homedepotdb.query('INSERT INTO customer_questions (product_id, question_content, user_name, question_date, response_user_name, response_content, response_date) VALUES ($1)', [product.customerQuestionsValues]);
                await homedepotdb.query('INSERT INTO descriptions (fact, product_id) VALUES $1', [product.descriptionsValues]);
                await homedepotdb.query('INSERT INTO img_in_product_list (product_id, img_product_list_ref, img_product_list_source) VALUES $1', [product.img_in_product_listValues]);
                await homedepotdb.query('INSERT INTO img_urls (product_id, img_url) VALUES $1', [product.img_urlsValues]);
                await homedepotdb.query('INSERT INTO product_list (product_id, item_description) VALUES $1', [product.product_listValues]);
                await homedepotdb.query('INSERT INTO productdetails_images (imagesrc, alttext, title, detail, product_id) VALUES $1', [product.productdetails_imagesValues]);
                await homedepotdb.query('INSERT INTO products_description (product_id, description) VALUES $1', [product.products_descriptionValues]);
                await homedepotdb.query('INSERT INTO promotions (product_id, price_original, price_reduced) VALUES $1', [product.promotionsValues]);
                await homedepotdb.query('INSERT INTO specifications_details (battery_amp_hours, blows_per_minute, color_family, cordless_tool_type, drill_driver_type, included, motor_type, power_tool_features, returnable, torque, battery_motor_type, other_included, condition, is_cordless, drive_size, max_speed_rpm, num_batteries_included, product_weight, tools_product_type, voltage, product_id) VALUES $1', [product.specifications_detailsValues]);
                await homedepotdb.query('INSERT INTO specifications_dimensions (product_id, depth, depth_unit_of_measure, width, width_unit_of_measure, height, height_unit_of_measure) VALUES $1', [product.specifications_dimensionsValues]);
                await homedepotdb.query('INSERT INTO store_local (zipcode, city_name, product_id, inventory) VALUES $1', [product.store_localValues])
                await homedepotdb.query('INSERT INTO store_online (product_id, inventory, days_to_ship) VALUES $1', [product.store_onlineValues])
                await homedepotdb.query('INSERT INTO warranty_certifications (product_id, certifications_listings, manufacturer_warranty) VALUES $1', [product.warranty_certificationsValues])
                // reviews
                return true;
            }));
        }
        return 'Success Generating Products';

    } catch(e) {
        console.error(e);
        return 'Failure Generating Products';
    }
}

// console.log(await generateProducts(1))

// const testFn = () => {
//     homedepotdb.query('INSERT INTO store_local')
// }

// fs.writeFile('test2.js', 'hi', ()=> {
//     console.log('wrote')
// });

const generateProductsSimplified = async() => {
    try {
        for(let i = 0; i < 2000000; i++) {
            await homedepotdb.query('INSERT INTO PRODUCTS (product_name, manufacturer, price, has_warranty) VALUES ($1, $2, $3, $4)',
             [faker.commerce.productName(), faker.vehicle.manufacturer(), faker.commerce.price({ min: 20, max: 1200, dec: 2}), faker.datatype.boolean(.5)]);
            
            console.log('INSERT ', i)
        }
    } catch(e) {
        console.log(e);
        return;
    }
}

generateProductsSimplified();