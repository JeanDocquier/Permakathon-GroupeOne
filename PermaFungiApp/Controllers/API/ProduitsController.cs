﻿using PermaFungi.DAL.Models;
using PermaFungiApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using PermaFungi.DAL.Repositories;

namespace PermaFungiApp.Controllers.API
{
    public class ProduitsController : ApiController
    {
        private string connexion = "Persist Security Info=False;User ID=AlpagaUser;Password=AlpagaUser;Initial Catalog=Alpaga;Server=192.168.0.100\\HACKATHON";

        public HttpResponseMessage Get()
        {
            ProduitRepository ProdRepo = new ProduitRepository(connexion);
            var prod = ProdRepo.GetAll().ToList();
            return Request.CreateResponse(HttpStatusCode.OK, prod);
        }

        public HttpResponseMessage Get(int id)
        {
            ProduitRepository ProdRepo = new ProduitRepository(connexion);
            var result = ProdRepo.GetOne(id);
            if (result != null)
            {
                return Request.CreateResponse(HttpStatusCode.OK, result);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, "prod with ID: " + id.ToString() + "not found");
            }
        }
        public HttpResponseMessage Get(DateTime debut, DateTime fin,int idPF)
        {
            ProduitRepository ProdRepo = new ProduitRepository(connexion);
            var ventes = ProdRepo.GetByDate(debut,fin,idPF);
            if (ventes != null)
            {
                return Request.CreateResponse(HttpStatusCode.OK, ventes);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, "prod with ID: " + ventes.ToString() + "not found");
            }
        }
        //create
        public HttpResponseMessage Post([FromBody]Produit prod)
        {
            try
            {
                ProduitRepository ProdRepo = new ProduitRepository(connexion);
                ProdRepo.Insert(prod);
                return Request.CreateResponse(HttpStatusCode.Created, prod);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }
        //update
        public HttpResponseMessage Put([FromBody]Produit prod)
        {
            try
            {
                ProduitRepository ProdRepo = new ProduitRepository(connexion);
                if (prod == null)
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "prod Not Found");
                }
                ProdRepo.Update(prod);
                return Request.CreateResponse(HttpStatusCode.OK, prod);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        public HttpResponseMessage delete(int id)
        {
            try
            {
                ProduitRepository ProdRepo = new ProduitRepository(connexion);
                var prodToDelete = ProdRepo.GetOne(id);
                if (prodToDelete == null)
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "prod with ID: " + id.ToString() + "not found");
                ProdRepo.Delete(id);
                return Request.CreateResponse(HttpStatusCode.OK);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ex);
            }
        }
    }
}
