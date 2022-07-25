using System.Collections.Generic;
using System.Threading.Tasks;

namespace DataLibrary
{
    public interface IDataAccess
    {
        //
        // Author: Josue Gonzalez
        // Description: This class is an interface for the DataAccess class
        //
        Task<List<T>> LoadData<T, U>(string sql, U parameters, string connectionString);
        Task SaveData<U>(string sql, U parameters, string connectionString);
    }
}