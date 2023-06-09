/* eslint-disable jsx-a11y/no-static-element-interactions */
import React, { useState, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { useNavigate } from 'react-router-dom';
import { fetchInstruments, deleteInstru } from '../../../actions/instrumentActions';

import InstrumentForm from '../../Create/InstrumentForm';

function Instruments() {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const [collapse, setCollapse] = useState(null);
  const [instruData, setInstruData] = useState([]);
  const instruments = useSelector((state) => state.instrument.instruments);
  const [selectedInstrument, setSelectedInstrument] = useState(null);
  const [showModal, setShowModal] = useState(false);
  const [showCreateModal, setShowCreateModal] = useState(false);
  const userRole = useSelector((state) => state.user.loggedInUser.user.role);
  const [searchTerm, setSearchTerm] = useState('');

  const handleSearchChange = (event) => {
    setSearchTerm(event.target.value);
  };

  const filteredInstruments = instruData.filter((instru) =>
    `${instru.pupitre}`.toLowerCase().includes(searchTerm.toLowerCase())
  );

  useEffect(() => {
    if (userRole !== 'board' && userRole !== 'admin') {
      navigate('/');
    }
  }, [userRole, navigate]);

  useEffect(() => {
    dispatch(fetchInstruments());
  }, [dispatch]);

  useEffect(() => {
    if (instruments) {
      setInstruData(instruments);
    }
  }, [instruments]);

  const toggleCollapse = (id) => {
    if (collapse === id) {
      setCollapse(null);
    } else {
      setCollapse(id);
    }
  };
  const toggleModal = (instru) => {
    setSelectedInstrument(instru);
    setShowModal(!showModal);
  };
  const toggleCreateModal = () => {
    setShowCreateModal(!showCreateModal);
  };
  const handleDelete = async (instruId) => {
    try {
      await dispatch(deleteInstru(instruId));
      setInstruData(instruData.filter((instru) => instru.id !== instruId));
    } catch (error) {
      /* console.error('Error deleting user:', error); */
    }
  };

  return (
    <div className="bg-base-300 h-full">
      <h2 className="text-3xl font-bold">Instruments</h2>
      <div className='flex flex-col md:flex-row md:justify-between'>
        <input
          type="text"
          placeholder="Recherche..."
          className="input input-bordered mb-4"
          value={searchTerm}
          onChange={handleSearchChange}
        />
        <button type="submit" className="btn hover:bg-green-500 " onClick={() => toggleCreateModal()}>Ajouter un instrument</button>
      </div>
      {filteredInstruments.map((u) => (
        <div className="card card-side bg-base-100 shadow-md m-4 p-4 flex flex-col relative" key={u.id}>
          <div onClick={() => toggleCollapse(u.id)} onKeyDown={() => {}} className="flex items-center">
            <figure className="mr-4">
              <img
                src="https://fakeimg.pl/100x100/?text=Instrument"
                alt="Aperçu"
                className="rounded-full"
              />
            </figure>
            <div className="card-body">
              <h2 className="card-title text-xl font-bold">{u.code}</h2>
              <p className="normal-case first-letter:capitalize text-gray-600">
                {u.observation}
              </p>
            </div>
          </div>
          <div className='flex flex-col items-end'>
              <button type="submit" onClick={() => toggleModal(u)} className="btn mt-4 absolute top-0 right-4 hover:bg-sky-500">
                Edition
              </button>
              <button type="submit" className="btn mt-4 top-10 right-4 hover:btn-warning" onClick={() => handleDelete(u.id)}>
                suppression
              </button>
            </div>
          {collapse === u.id && (
          <div className="card-body mt-4">
            <div>
              <p>
                <span className="font-medium">Pupitre: </span>
                {u.pupitre}
              </p>
              <p>
                <span className="font-medium">Tirant: </span>
                {u.rods}
              </p>
              <p>
                <span className="font-medium">Profondeur: </span>
                {u.depth}
              </p>
              <p>
                <span className="font-medium">Poids: </span>
                {u.weight}
              </p>
              <p>
                <span className="font-medium">Sticker: </span>
                {u.sticker}
              </p>
            </div>
          </div>
          )}
        </div>
      ))}
      {showModal && (
        <>
          <input type="checkbox" id="my-modal-3" className="modal-toggle" />
          <div
            className={`modal  ${showModal ? 'modal-open' : ''}`}
          >
            <div className="modal-box relative w-11/12 max-w-5xl">
              <button type="submit" onClick={() => { toggleModal(); }} className="btn btn-sm btn-circle absolute right-2 top-2">✕</button>
              <InstrumentForm data={[selectedInstrument]} isEditMode closeModal={toggleModal} onSubmitFormUser={() => dispatch(fetchInstruments())} />
            </div>
          </div>
        </>
      )}
      {showCreateModal && (
        <>
          <input type="checkbox" id="my-modal-3" className="modal-toggle" />
          <div
            className={`modal  ${showCreateModal ? 'modal-open' : ''}`}
          >
            <div className="modal-box relative w-11/12 max-w-5xl">
              <button type="submit" onClick={() => { toggleCreateModal(); }} className="btn btn-sm btn-circle absolute right-2 top-2">✕</button>
              <InstrumentForm data={[]} mode="create" isEditMode={false}closeModal={toggleCreateModal} onSubmitFormUser={() => {}} />
            </div>
          </div>
        </>
      )}
    </div>
  );
}

export default Instruments;
