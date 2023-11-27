using System;
using System.IO;
using System.Net;
using System.Text;
using System.Xml;

namespace SistemaVenta.BLL.Interfaces
{
    public interface IServiceConsumer
    {
        string ReadXmlContent(string filePath);
    }

    public class ServiceConsumer : IServiceConsumer
    {
        public string ReadXmlContent(string filePath)
        {
            string content = string.Empty;
            using (WebClient client = new WebClient())
            {
                byte[] data = client.DownloadData(filePath);
                string xmlString = Encoding.UTF8.GetString(data);
                using (XmlReader reader = XmlReader.Create(new StringReader(xmlString)))
                {
                    while (reader.Read())
                    {
                        content += reader.ReadOuterXml();
                    }
                }
            }
            return content;
        }
    }
}