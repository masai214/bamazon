var mysql = require('mysql');
var inquirer = require('inquirer');


var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "root",
    database: "bamazon"
});


connection.connect(function (err) {
    if (err) throw err;
    console.log('Connected as ID ' + connection.threadId);
    itemList();
});


function itemList() {
    connection.query("SELECT * FROM products", function (err, res) {
        console.table(res);
        console.log("Here is what we have!");
        questions();
    });
}


function questions() {
    inquirer
        .prompt([
            {
                type: "input",
                message: "what is the item's ID you like to purchase? ",
                name: "itemID"
            },
            {
                type: "input",
                message: "How many would you like to purchase?",
                name: "productPurchased"
            }

        ])
        .then(function (response) {
            var items = response.itemID - 1;
            connection.query("SELECT * FROM products ", function (err, res) {
                if (err) throw err;
                var quantity = res[items].stock_quantity - response.productPurchased;
                var products = res[items].product_name;
                var result = res[items].price * response.productPurchased;

                if (res[items].stock_quantity >= response.productPurchased) {
                    connection.query("UPDATE products SET ? WHERE ?", [{ stock_quantity: quantity }, { item_id: items + 1 }],
                        function (err, res) {
                            console.log("You just bought " + response.productPurchased + " " + products + "!");
                            console.log("Your total is $" + result + " dollars");
                            console.log("Stock left:  " + quantity);
                            console.log("Your transaction is complete. Thank you for purchasing with bamazon!");
                            connection.end();
                        });
                } else if (res[items].stock_quantity < response.productPurchased) {
                    console.log("Unforunately, we're currently out of stock, please try again in the future.")
                    questions()
                }else{
                    console.log("Error Please Try Again.")
                }


            })
        });

    }