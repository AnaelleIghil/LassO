import { createPool} from 'generic-pool';

const pool = createPool({
    create: async()=>{
        const client = new Client();
        return client.connect().then(()=>{
            client.on('error', console.log);
            return client;
        });
    },
    destroy : async (client: Client)=>{
        return client.end().then(()=>{ })
    },
    validate :(client: Client)=>{
        return Promise.resolve(!client.closed);
    }
}, {testOnBorrow: true});

pool.use()