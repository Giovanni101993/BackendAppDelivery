const Store = require("../models/store.js");
const Rol = require("../models/rol.js");
const StoreHasDelivery = require("../models/store_has_delivery.js");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const keys = require("../config/keys.js");
const storage = require("../utils/cloud_storage.js");

module.exports = {
  findDeliveryMen(req, res) {
    const id_store = req.params.id_store;
    Store.findDeliveryMen(id_store, (err, data) => {
      if (err) {
        return res.status(501).json({
          success: false,
          message: "Hubo un error con el registro del usuario",
          error: err,
        });
      }
      return res.status(201).json(data);
    });
  },

  login(req, res) {
    const email = req.body.email;
    const password = req.body.password;

    Store.findByEmail(email, async (err, myUser) => {
      console.log("ERROR", err);
      console.log("USUARIO", myUser);

      if (err) {
        return res.status(501).json({
          success: false,
          message: "Hubo un error con el registro del usuario",
          error: err,
        });
      }

      if (!myUser) {
        return res.status(401).json({
          //EL CLIENTE NO ESTA AUTORIZADO PARA HACER ESTA PETICION
          success: false,
          message: "El email no fue encontrado",
        });
      }

      const isPasswordValid = await bcrypt.compare(password, myUser.password);

      if (isPasswordValid) {
        const token = jwt.sign(
          { id: myUser.id, email: myUser.email },
          keys.secretOrKey,
          {}
        );

        const data = {
          id: `${myUser.id}`,
          name: myUser.name,
          lastname: myUser.lastname,
          email: myUser.email,
          phone: myUser.phone,
          image: myUser.image,
          address: myUser.address,
          departamento: myUser.departamento,
          ciudad: myUser.ciudad,
          session_token: `JWT ${token}`,
          roles: JSON.parse(myUser.roles)

        };

        return res.status(201).json({
          success: true,
          message: "El usuario fue autenticado",
          data: data,
        });
      } else {
        return res.status(401).json({
          //EL CLIENTE NO ESTA AUTORIZADO PARA HACER ESTA PETICION
          success: false,
          message: "El password es incorrecto",
        });
      }
    });
  },

  register(req, res) {
    const store = req.body; //CAPTURA LOS DATOS DE USUARIO
    Store.create(store, (err, data) => {
      if (err) {
        return res.status(501).json({
          success: false,
          message: "Hubo un error con el registro del usuario",
          error: err,
        });
      }

      return res.status(201).json({
        success: true,
        message: "El registro se realizo correctamente",
        data: data, //ES EL ID DEL NUEVO USUARIO
      });
    });
  },

  async registerWithImage(req, res) {
    const store = JSON.parse(req.body.user); //CAPTURA LOS DATOS DE USUARIO
    const files = req.files;

    if (files.length > 0) {
      const path = `image_${Date.now()}`;
      const url = await storage(files[0], path);

      if (url != undefined && url != null) {
        store.image = url;
      }
    }

    Store.create(store, (err, data) => {
      if (err) {
        return res.status(501).json({
          success: false,
          message: "Hubo un error con el registro del usuario",
          error: err,
        });
      }

      store.id = `${data}`;
      const token = jwt.sign(
        { id: store.id, email: store.email },
        keys.secretOrKey,
        {}
      );
      store.session_token = `JWT ${token}`;

      Rol.create(store.id, 2, (err, data) => {
        if(err){
            return res.status(501).json({
                success: false,
                message: 'Hubo un error con el registro del rol de usuario',
                error: err
            });
        }
        else{
            return res.status(201).json({
                success: true,
                message: 'El registro se realizo correctamente',
                data:user
            });
        }
    });
    });
  },

  async updateWithImage(req, res) {
    store.id = id_iser;
    const store = JSON.parse(req.body.store); //CAPTURA LOS DATOS DE USUARIO

    const files = req.files;

    if (files.length > 0) {
      const path = `image_${Date.now()}`;
      const url = await storage(files[0], path);

      if (url != undefined && url != null) {
        store.image = url;
      }
    }

    Store.update(store, (err, data) => {
      if (err) {
        return res.status(501).json({
          success: false,
          message: "Hubo un error con el registro del usuario",
          error: err,
        });
      } else {
        return res.status(201).json({
          success: true,
          message: "El usuario se actualizo correctamente",
          data: store,
        });
      }
    });
  },

  async updateWithoutImage(req, res) {
    const store = req.body; //CAPTURA LOS DATOS DE USUARIO

    Store.updateWithoutImage(store, (err, data) => {
      if (err) {
        return res.status(501).json({
          success: false,
          message: "Hubo un error con el registro del usuario",
          error: err,
        });
      } else {
        return res.status(201).json({
          success: true,
          message: "El usuario se actualizo correctamente",
          data: store,
        });
      }
    });
  },

  findByRol(req, res) {
    const id_user = req.params.id_user;
    const id_rol = req.params.id_rol;

    Rol.findByRol(id_user, id_rol, (err, data) => {
      if (err) {
        return res.status(501).json({
          success: false,
          message: "Hubo un error",
          error: err,
        });
      }
      return res.status(201).json(data);
    });
  },

  async getAllStore(req, res) {
    Store.getAllStore((err, data) => {
      if (err) {
        return res.status(501).json({
          success: false,
          message: "Hubo un problema al listar las tiendas",
          error: err,
        });
      }

      return res.status(201).json(data);
    });
  },
};
