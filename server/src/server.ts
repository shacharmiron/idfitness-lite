process.env['NODE_CONFIG_DIR'] = __dirname + '/configs';

import 'dotenv/config';
import App from '@/app';
import AuthRoute from '@routes/auth.route';
import IndexRoute from '@routes/index.route';
import UsersRoute from '@routes/users.route';
import validateEnv from '@utils/validateEnv';
import RolesRoute from './routes/roles.route';
// import SoldiersRoute from '@routes/soldiers.route';
// import ForcesRoute from '@routes/forces.route';
// import EventsRoute from '@routes/events.route';

validateEnv();

const app = new App([new IndexRoute(), new UsersRoute(), new AuthRoute(), new RolesRoute(),/*, new SoldiersRoute(), new ForcesRoute(), new EventsRoute()*/]);

app.listen();
