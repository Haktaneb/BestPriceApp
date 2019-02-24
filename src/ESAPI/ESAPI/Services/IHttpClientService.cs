using System;
using ESAPI.Models;
namespace ESAPI.Services
{
    public interface IHttpClientService
    {
        System.Threading.Tasks.Task<ElasticModel> GetModelsAsync(string url);
    }
}
