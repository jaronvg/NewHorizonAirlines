using System;
using System.Collections.Generic;
using System.Text;
using MySql.Data.MySqlClient;
using System.Data;
using System.Linq;
using Dapper;
using System.Threading.Tasks;

namespace DataLibrary
{
    //
    // Author: Josue Gonzalez
    // Description: Class is used to access SQL database (DB).
    // Source:https://iamtimcorey.com/p/blazor-server-in-depth
    //      --Source facilitated linkage of DB to Visual Studio.
    //      --Installed and utilized Dapper and MySql.Data.
    //

    public class DataAccess : IDataAccess
    {
        public async Task<List<T>> LoadData<T, U>(string sql, U parameters, string connectionString)
        {
            // The connectionString is used to open a connection to the SQL DB.
            using (IDbConnection connection = new MySqlConnection(connectionString))
            {
                // A query is passed through the DB connection.
                // Await is used to account for the async query.
                // The query output is stored in rows and returned.
                var rows = await connection.QueryAsync<T>(sql, parameters);

                return rows.ToList();
            }
        }
        public Task SaveData<U>(string sql, U parameters, string connectionString)
        {
            // The connectionString is used to open a connection to the SQL DB.
            using (IDbConnection connection = new MySqlConnection(connectionString))
            {
                // A query is passed through the DB connection.
                return connection.ExecuteAsync(sql, parameters);

            }
        }

    }
}
