
const item = ['coffee', '$2.00', '$2.50' ,'$2.75' ];


const [ content, ,price] = item;

console.log(`The price of the ${content} is ${price} `);