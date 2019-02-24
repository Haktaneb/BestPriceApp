using System;
using Nest;
using ESAPI.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ESAPI.Services
{
    public class ElasticSearchService : IElasticSearchService
    {
        private readonly IElasticClient elasticClient;
        public ElasticSearchService(IElasticClient elasticClient)
        {
            this.elasticClient = elasticClient;
        }

        public async System.Threading.Tasks.Task InsertElasticAsync(ElasticModel elasticModel)
        {
            var asyncIndexResponse = await elasticClient.IndexDocumentAsync(elasticModel);
        }

       

        public IEnumerable<ElasticModel> SearchByRange()
        {
            var date1 = new DateTime(2018, 10, 27);
            var date2 = new DateTime(2018, 10, 28);
            var searchResponse =  elasticClient.Search<ElasticModel>(s => s
            .Query(q => q
            .DateRange(r => r
                    .Field(f => f.Date)
                       .GreaterThanOrEquals(date1)
                       .LessThan(date2)
                      )
            )
            
            );
            return searchResponse.Documents;

        }
    }
}
