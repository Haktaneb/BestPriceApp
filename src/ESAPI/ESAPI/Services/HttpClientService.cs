using System;
using ESAPI.Models;
using System.Net.Http;
using Newtonsoft.Json;

namespace ESAPI.Services
{
    public class HttpClientService : IHttpClientService
    {
        private static readonly HttpClient client = new HttpClient();

        public async System.Threading.Tasks.Task<ElasticModel> GetModelsAsync(string url)
        {
            var elasticModel = new ElasticModel();
           var responseString = JsonConvert.DeserializeObject<Welcome>(await client.GetStringAsync(url));
            elasticModel.Welcome = responseString;
            return elasticModel;

        }
    }
}
