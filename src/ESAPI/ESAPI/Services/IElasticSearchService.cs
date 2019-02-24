using System;
using System.Collections.Generic;
using ESAPI.Models;
namespace ESAPI.Services
{
    public interface IElasticSearchService
    {
        System.Threading.Tasks.Task InsertElasticAsync(ElasticModel welcome);
        IEnumerable<ElasticModel> SearchByRange();
    }
}
