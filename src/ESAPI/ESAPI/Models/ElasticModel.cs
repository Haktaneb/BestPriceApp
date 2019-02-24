using System;
namespace ESAPI.Models
{
    public class ElasticModel
    {     
        public Guid ID
        {
            get
            {
                return Guid.NewGuid(); 
            }
            set { }
        }
        public  DateTime Date
        {
            get
            {
                return DateTime.Now;
            }
            set { }
        }
        public Welcome Welcome
        {
            get;
            set;
        }
    }
}
