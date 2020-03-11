﻿using PermaFungi.DAL.Infra;
using PermaFungi.DAL.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PermaFungi.DAL.Models
{
    public class Collabore : IEntity<CompositeKey<int, int>>
    {
        private int _idPartenaireClient;
        private int _idPermafungi;

        public int IdPartenaireClient { get => _idPartenaireClient; set => _idPartenaireClient = value; }
        public int IdPermaFungi { get => _idPermafungi; set => _idPermafungi = value; }

        public CompositeKey<int, int> Id
        {
            get
            {
                return new CompositeKey<int, int>() { PK1 = IdPartenaireClient, PK2 = IdPermaFungi};
            }
        }

    }
}
