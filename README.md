# Ethereum (0x) relayer

## Introduction

Ethereum (0x) relayer for your community token which seemlessly create a marketplace (in-game) for digital assets. This also support the trading of any ERC-20 or ERC-721 assets.

## Multi Script Development

`eth-token-kit` allow you to choose Typescript or Javascript based development based on your choise.

The Javascript is basically auto-generated from the Typescript, but as much as possible I have tried to ensured the Javascript generated is readable.

## 

To develop ontop of `eth-token-kit`, follow the following instructions:

1. Go to the folder where you want to clone the code.

2. Clone this repository using `git clone https://github.com/dhanrajdadhich78/Ethereum/eth-token-kit.git

3. Open the `config` file (depending on the script language you like) and edit the whitelisted tokens:

    - `WHITELISTED_TOKENS` -- Which tokens you would like to host orderbooks for.

4. Open the `.env` file and edit the below properties:

    - `NETWORK_ID` -- the network for relayer to run on (e.g: `1` -> mainnet, `42` -> Kovan, 3 -> Ropsten, etc...)
    - `FEE_RECIPIENT` -- The Ethereum address which should be specified as the fee recipient in orders your relayer accepts.
    - `MAKER_FEE_ZRX_UNIT_AMOUNT` -- The flat maker fee of your choice to receive for filled orders hosted.
    - `TAKER_FEE_ZRX_UNIT_AMOUNT` -- The flat taker fee of your choice to receive for filled orders hosted.
    - `RPC_URL` -- Update with your node url. 

5. Make sure you have [Yarn](https://yarnpkg.com/en/) installed.

6. Install the dependencies:

    ```sh
    yarn
    ```

7. Build the project [This step is for Typescript users only]

    ```sh
    yarn build:ts
    ```

    or build & watch:

    ```sh
    yarn watch:ts
    ```

    **Note:** You must have installed Node.js version > v8.0. You cal also add a transpiler like [Babel](https://babeljs.io/)) to this project if do want to run with legacy scripts.

8. Start / RUN

    ```sh
    yarn start:ts
    ```

    OR

    ```sh
    yarn start:js
    ```

## Commands

### Typescript project commands:

-   `yarn build:ts` - Build the code
-   `yarn lint:ts` - Lint the code
-   `yarn start:ts` - Starts the relayer
-   `yarn watch:ts` - Watch the source code and rebuild on change
-   `yarn prettier:ts` - Auto-format the code

### Javascript project commands:

-   `yarn start:js` - Start the relayer
-   `yarn prettier:js` - Auto-format the code


## Client API (0xproject)

Connect `eth-token-kit` relayer with 0xproject to get the order information. You can follow[this tutorial](https://0xproject.com/wiki#Find,-Submit,-Fill-Order-From-Relayer).

Test your relayer using this CURL request from the command-line:

```sh
curl http://localhost:3000/v2/orders
```

Initially the `records` array would be empty as there is no transaction so far:

```
{
    "total": 0,
    "page": 0,
    "perPage": 20,
    "records": []
}
```


## Database

This project uses [TypeORM](https://github.com/typeorm/typeorm). It makes it easier for anyone to switch out the backing database used by this project. By default, this project uses an [SQLite](https://sqlite.org/docs.html) database.

Because I  want to support both Javascript and Typescript codebases, I  don't use `TypeORM`'s [decorators](https://github.com/typeorm/typeorm/blob/master/docs/decorator-reference.md) (since they don't transpile nicely into readable Javascript). TypeORM shines with decorators hoI ver, so you might want to use them if you're going to be working in Typescript.

## Deployment

First, install Docker ([mac](https://docs.docker.com/docker-for-mac/install/), [windows](https://docs.docker.com/docker-for-windows/install/)).

   **Note** The `eth-token-kit` can be deployed on docker container. 

```sh
docker build -t eth-token-kit .
```

You can check that the image was built by running:

```sh
docker images
```

And launch it with

```sh
docker run -p 3000:3000 -d eth-token-kit
```

Check that it's working by running

```
curl http://localhost:3000/v2/asset_pairs
```

## Legal Disclaimer

The laws and regulations applicable to the use and exchange of digital assets and blockchain-native tokens, including through any software developed using the licensed work created by ZeroEx Intl. as described here (the “Work”), vary by jurisdiction. As set forth in the Apache License, Version 2.0 applicable to the Work, developers are “solely responsible for determining the appropriateness of using or redistributing the Work,” which includes responsibility for ensuring compliance with any such applicable laws and regulations.
See the Apache License, Version 2.0 for the specific language governing all applicable permissions and limitations: http://www.apache.org/licenses/LICENSE-2.0
