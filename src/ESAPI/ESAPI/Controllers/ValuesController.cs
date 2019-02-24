using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ESAPI.Services;
using Microsoft.AspNetCore.Mvc;


namespace ESAPI.Controllers
{

    [Route("api/[controller]/[action]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        private readonly IHttpClientService httpClientService;
        private readonly IElasticSearchService elasticSearchService;

        public ValuesController(IHttpClientService httpClientService,IElasticSearchService elasticSearchService)
        {
            this.httpClientService = httpClientService;
            this.elasticSearchService = elasticSearchService;
        }
       

        public async Task<ActionResult<string>> GetApiCall()
        {
            var url = "http://api.openweathermap.org/data/2.5/weather?id=742865&appid=cd533a4d285b167b15dfc1cfa4bdd1d0";        
            var  weatherResponse = await httpClientService.GetModelsAsync(url);
            await elasticSearchService.InsertElasticAsync(weatherResponse);
            return Ok(weatherResponse);
        }

        // POST api/values
        [HttpGet]
        public ActionResult Search()
        {
            return Ok(elasticSearchService.SearchByRange());
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
