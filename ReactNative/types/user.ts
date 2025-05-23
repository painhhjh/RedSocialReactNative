//Define la interfaz para el objeto de usuario. Representa los datos básicos de un usuario autenticado.

export interface Usuario {
  id: string | number; // Identificador único del usuario
  email: string; // Correo electrónico del usuario
  nombre?: string; // Nombre del usuario (opcional)
  isActive: boolean; // Indica si el usuario está activo
  createdAt: Date; // Fecha de creación del usuario
  updatedAt?: Date; // Fecha de última actualización del usuario (opcional)
}