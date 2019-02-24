using System;
using System.Xml.Linq;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Nest;
using ESAPI.Models;

namespace ESAPI.Extensions
{
    public static class ElasticsearchExtensions
    {
        public static void AddElasticsearch(
         this IServiceCollection services, IConfiguration configuration)
        {
            var url = configuration["elasticsearch:url"];
            var defaultIndex = configuration["elasticsearch:index"];

            var settings = new ConnectionSettings(new Uri(url))
                .DefaultIndex(defaultIndex)
                .DefaultMappingFor<ElasticModel>(m => m
                   .IndexName(defaultIndex)
                 )
                
                .EnableDebugMode()
                .PrettyJson()
                .RequestTimeout(TimeSpan.FromMinutes(2));


            var client = new ElasticClient(settings);
            var createIndexResponse = client.CreateIndex(defaultIndex, c => c
        .Mappings(ms => ms
            .Map<ElasticModel>(m => m
                .AutoMap()
            )
        )
    );

            services.AddSingleton<IElasticClient>(client);
        }
    }
}

