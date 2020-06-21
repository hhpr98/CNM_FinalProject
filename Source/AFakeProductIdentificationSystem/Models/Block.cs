using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using static AFakeProductIdentificationSystem.Models.Transaction;

namespace AFakeProductIdentificationSystem.Models
{
    public class Block
    {
        private readonly DateTime _timeStamp;
        private long _nonce;
        public string PreviousHash { get; set; }
        public List<Transactions> transactions { get; set; }
        public string Hash { get; private set; }
        public string productInfor { get; set; }

        public Block(DateTime timeStamp, List<Transactions> transactions, string previousHash = "", string productInfor = "")
        {
            _timeStamp = timeStamp;
            _nonce = 0;
            this.transactions = transactions;
            PreviousHash = previousHash;
            this.productInfor = productInfor;
            Hash = CreateHash();
        }
        public void MineBlock(int proofOfWorkDifficulty)
        {
            string hashValidationTemplate = new String('0', proofOfWorkDifficulty);

            while (Hash.Substring(0, proofOfWorkDifficulty) != hashValidationTemplate)
            {
                _nonce++;
                Hash = CreateHash();
            }
            //Console.WriteLine("Blocked with HASH={0} successfully mined!", Hash);
        }
        public string CreateHash()
        {
            // Create a SHA256 
            using (SHA256 sha256 = SHA256.Create())
            {
                //string rawData = PreviousHash + _timeStamp + transactions + _nonce;
                string rawData = PreviousHash + _timeStamp + productInfor + _nonce;

                // ComputeHash - returns byte array 
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                //var encryptedResult = Encoding.Default.GetString(bytes);
                //return Encoding.Default.GetString(bytes);

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}