<template>
    <div class="container">
      <h1>Examen</h1>
      <!-- Select para elegir usuario -->
      <select>
        <option value="">Seleccionar usuario</option>
        <option></option>
      </select>
      <div class="collapse" id="collapseExample">
        <div class="card card-body">
          <div class="row">
            <div class="col-lg-12">
              <label for="">Titulo</label>
              <input type="text" class="form-control" />
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <label for="">Body</label>
              <input type="text" class="form-control" />
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <button class="btn btn-warning">Edit</button>
              <button class="btn btn-success">
                Dar de Alta
              </button>
            </div>
          </div>
        </div>
      </div>
  
      <div class="row">
        <div class="col-lg-12 d-flex justify-content-end">
          <button class="btn btn-success" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample"
            aria-expanded="false" aria-controls="collapseExample">
            Dar de Alta
          </button>
        </div>
      </div>
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>Title</th>
            <th>Body</th>
            <th>Operaciones</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>
              <b>ELBICHO</b>
            </td>
            <td>SIUUU</td>
            <td>
              <button class="btn btn-warning" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample"
                aria-expanded="false" aria-controls="collapseExample">
                Edit
              </button>
  
              <button class="btn btn-danger" >
                Delete
              </button>
              <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                View comments
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <ul>
              <li >
                si
              </li>
            </ul>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
              Close
            </button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>
  </template>
